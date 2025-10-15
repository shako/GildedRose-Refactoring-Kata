Feature: Update quality for sulfuras

  Scenario Outline: sellIn remains unchanged
    Given The item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 999         |
      | 1            | 10            | 1           |
      | 0            | 10            | 0           |
      | -1           | 10            | -1          |

  Scenario Outline: sellIn remains unchanged
    Given The item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Sulfuras, Hand of Ragnaros" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 100           | 100          |
      | 10           | 5             | 5            |
      | 10           | 2             | 2            |
      | 10           | 1             | 1            |
      | 10           | 0             | 0            |

  Scenario Outline: sellIn remains unchanged even when sell by date has passed
    Given The item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Sulfuras, Hand of Ragnaros" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 100           | 100          |
      | 0            | 100           | 100          |
      | -1           | 100           | 100          |
      | -2           | 3             | 3            |
      | -3           | 2             | 2            |
      | -4           | 1             | 1            |
      | -5           | 0             | 0            |