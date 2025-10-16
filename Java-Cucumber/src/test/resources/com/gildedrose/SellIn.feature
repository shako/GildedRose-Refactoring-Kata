Feature: Effect on SellIn

  Scenario Outline: sellIn decreases by 1 for regular items
    Given The item as "Aged Brie" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Aged Brie" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 998         |
      | 1            | 10            | 0           |
      | 0            | 10            | -1          |
      | -1           | 10            | -2          |

  Scenario Outline: sellIn decreases by 1 for aged brie
    Given The item as "reqularItem" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "reqularItem" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 998         |
      | 1            | 100           | 0           |
      | 0            | 100           | -1          |
      | -1           | 100           | -2          |

  Scenario Outline: sellIn decreases by 1 for backstage passes
    Given The item as "Backstage passes to a TAFKAL80ETC concert" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Backstage passes to a TAFKAL80ETC concert" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 998         |
      | 1            | 100           | 0           |
      | 0            | 100           | -1          |
      | -1           | 100           | -2          |

  Scenario Outline: sellIn remains unchanged for sulfuras
    Given The item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Sulfuras, Hand of Ragnaros" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 999         |
      | 1            | 10            | 1           |
      | 0            | 10            | 0           |
      | -1           | 10            | -1          |
