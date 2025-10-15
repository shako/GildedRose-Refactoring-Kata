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

  Scenario Outline: quality decreases by 1 to a minimum of 0
    Given The item as "reqularItem" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "reqularItem" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 100           | 99           |
      | 10           | 5             | 4            |
      | 10           | 2             | 1            |
      | 10           | 1             | 0            |
      | 10           | 0             | 0            |

  Scenario Outline: once sell by date has passed, quality decreases by 2 to a minimum of 0
    Given The item as "reqularItem" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "reqularItem" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 100           | 99           |
      | 0            | 100           | 98           |
      | -1           | 100           | 98           |
      | -2           | 3             | 1            |
      | -3           | 2             | 0            |
      | -4           | 1             | 0            |
      | -5           | 0             | 0            |