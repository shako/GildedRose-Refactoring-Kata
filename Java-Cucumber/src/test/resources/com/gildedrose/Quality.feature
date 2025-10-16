Feature: Effect on quality

  Scenario Outline: quality decreases by 1 to a minimum of 0 for regular items
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

  Scenario Outline: quality increases by 1 to a maximum of 50 for aged brie
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

  Scenario Outline: quality increases by 2 to a maximum of 50 for backstage passes
    Given The item as "Backstage passes to a TAFKAL80ETC concert" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Backstage passes to a TAFKAL80ETC concert" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 14           | 0             | 1            |
      | 14           | 5             | 6            |
      | 14           | 48            | 49           |
      | 14           | 49            | 50           |
      | 14           | 50            | 50           |

  Scenario Outline: quality increases by 3 to a maximum of 50 for backstage passes for last 5 days
    Given The item as "Backstage passes to a TAFKAL80ETC concert" with sellIn <sellInBefore> and quality <qualityBefore>
    When I update the quality
    Then I should get item as "Backstage passes to a TAFKAL80ETC concert" with quality <qualityAfter>

    Examples:
      | sellInBefore | qualityBefore | qualityAfter |
      | 14           | 0             | 1            |
      | 14           | 5             | 6            |
      | 4            | 46            | 49           |
      | 4            | 47            | 50           |
      | 4            | 48            | 50           |
      | 4            | 49            | 50           |
      | 4            | 50            | 50           |

  Scenario Outline: quality remains unchanged for sulfuras
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

  Scenario Outline: once sell by date has passed, quality decreases by 2 to a minimum of 0 for regular items
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

  Scenario Outline: once sell by date has passed, quality decreases by 2 to a maximum of 50 for aged brie
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

  Scenario Outline: quality remains unchanged even when sell by date has passed for sulfuras
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