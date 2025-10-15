Feature: Update quality for aged brie

  Scenario Outline: sellIn decreases by 1
    Given The item as "Aged Brie" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Aged Brie" with sellIn <sellInAfter>

    Examples:
      | sellInBefore | qualityBefore | sellInAfter |
      | 999          | 5             | 998         |
      | 1            | 10            | 0           |
      | 0            | 10            | -1          |
      | -1           | 10            | -2          |

  Scenario Outline: quality increases by 1 to a maximum of 50
    Given The item as "Aged Brie" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Aged Brie" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 0             | 1            |
      | 10           | 5             | 6            |
      | 10           | 48            | 49           |
      | 10           | 49            | 50           |
      | 10           | 50            | 50           |

  Scenario Outline: once sell by date has passed, quality decreases by 2 to a maximum of 50
    Given The item as "Aged Brie" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Aged Brie" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 1            | 0             | 1            |
      | 0            | 0             | 2            |
      | -1           | 10            | 12           |
      | -2           | 47            | 49           |
      | -3           | 48            | 50           |
      | -4           | 49            | 50           |
      | -5           | 50            | 50           |