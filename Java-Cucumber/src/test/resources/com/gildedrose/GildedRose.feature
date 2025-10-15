Feature: Update quality for regular items

  Scenario Outline: sellIn decreases by 1
    Given The item as "reqularItem" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "reqularItem" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 998         |
      | 1            | 100           | 0           |
      | 0            | 100           | -1          |
      | -1           | 100           | -2          |

  Scenario Outline: quality decreases by 1
    Given The item as "reqularItem" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "reqularItem" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 10           | 5             | 4            |
      | 1            | 100           | 99           |