require 'test/unit'
require 'casa-attribute/loader'

class TestCASAAttributeTitle < Test::Unit::TestCase

  def load_attribute

    assert_nothing_raised do
      CASA::Attribute::Loader.load! 'class' => 'CASA::Attribute::Title', 'name' => 'title'
    end

    assert CASA::Attribute::Loader.loaded.has_key? 'title'

    CASA::Attribute::Loader.loaded['title']

  end

  def test_definition

    load_attribute

    assert CASA::Attribute::Title
    assert CASA::Attribute::Title.uuid == '1f2625c2-615f-11e3-bf13-d231feb1dc81'
    assert CASA::Attribute::Title.section == 'use'

  end

  def test_squash

    attr = load_attribute

    assert 'original' == attr.squash({
      'original' => {
        'use' => {
          'title' => 'original'
        }
      }
    })

    assert 'journal' == attr.squash({
      'original' => {
        'use' => {
          'title' => 'original'
        }
      },
      'journal' => [
        {
          'use' => {
            'title' => 'journal'
          }
        }
      ]
    })

    assert 'journal2' == attr.squash({
      'original' => {
        'use' => {
          'title' => 'original'
        }
      },
      'journal' => [
        {
          'use' => {
            'title' => 'journal'
          }
        },
        {
          'use' => {
            'title' => 'journal2'
          }
        },
      ]
    })

  end

  def test_filter

    attr = load_attribute

    assert true == attr.filter({
      'original' => {
        'use' => {
        }
      }
    })

    assert true == attr.filter({
      'original' => {
        'use' => {
          'title' => 'original'
        }
      }
    })

  end

  def test_transform

    attr = load_attribute

    assert 'original' == attr.transform({
      'attributes' => {
        'use' => {
          'title' => 'original'
        }
      }
    })

    attr = CASA::Attribute::Title.new 'title2'

    assert 'original' == attr.transform({
      'attributes' => {
        'use' => {
          'title2' => 'original'
        }
      }
    })

    attr = CASA::Attribute::Title.new 'title', {
      'transform' => Proc.new { |payload|
        if payload['identity']['id'] == '1' and payload['identity']['originator_id'] == 'a27f7590-8537-4a6b-9c19-35e983b114a4'
          'replaced'
        else
          payload['attributes'][section][name]
        end
      }
    }

    assert 'replaced' == attr.transform({
      'identity' => {
        'id' => '1',
        'originator_id' => 'a27f7590-8537-4a6b-9c19-35e983b114a4'
      },
      'attributes' => {
        'use' => {
          'title' => 'original'
        }
      }
    })

    assert 'original' == attr.transform({
      'identity' => {
        'id' => '2',
        'originator_id' => 'a27f7590-8537-4a6b-9c19-35e983b114a4'
      },
      'attributes' => {
        'use' => {
          'title' => 'original'
        }
      }
    })

  end

end