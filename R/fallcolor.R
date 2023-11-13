#' Annual Averages of Fall Color by Species
#'
#' Daily percentage of fall tree color in Mount Mansfield State Forest,
#' Vermont 1991 to 2021 (days 246 - 310 each year).
#' Annual measurements of fall color to establish the timing of developmental
#' events and trends, as a measure of forest condition (ie effects of stress
#' events) and long-term changes (i.e. effects of global climate change).
#'
#' @format 16380 observations of 5 variables
#' \itemize{
#'  \item **year**: factor, 1991-2018
#'  \item **elevation**: factor with levels: 1400, 2200, 2600 feet
#'  \item **species**: factor with levels:
#'   \itemize{
#'    \item "Red Maple (F)" (Acer rubrum) female
#'    \item "Red Maple (M)" (Acer rubrum) male
#'    \item "White Birch" aka paper birch (Betula papyrifera)
#'    \item "Yellow Birch", (Betula alleghaniensis)
#'    \item "White Ash", (Fraxinus americana)
#'    \item "Sugar Maple" (Acer saccharum)}
#'  \item **value**: numeric, Percentage 0-100.
#'
#'  Averaged amount of coloured leaves per species per site.
#'
#'  coloured means "not green" and "not dropped yet".
#'
#'  Total of coloured leaves + green leaves + dropped leaves = 100%
#'
#' }
#'
#' @details
#' Geographic Coverage:
#'
#' Coordinates
#' \itemize{
#'  \item -72.865715, 44.525266
#'  \item -72.82626, 44.525266
#'  \item -72.82626, 44.532476
#'  \item -72.865715, 44.532476
#'  \item -72.865715, 44.525266}
#'
#' **Differences in Monitoring Methods**
#'
#' **1991**: New color and leaf drop: Visual crown ratings consist of percent color other than green, transparency (%), dieback-loss of leaves (%).
#'
#' **1992**: Monitoring on Mount Mansfield: Sugar maple and yellow birch are monitored at 1400 and 2200 feet on Mansfield
#'
#' **1995**: Red maple (male and female) and white ash are monitored at 1400 feet, only.
#'
#' **1999**: Yellow birch and paper birch at 2600 feet on Mansfield were added to represent high elevation fall phenology.
#'
#'
#' **1991** Initial crown ratings are recorded in July, then every other week until color and drop changes rapidly (end of September) when weekly measurements are made. Full leaf off density is used to calculate percent leaf drop at each visit.
#'
#' **2001**: New color and leaf drop methods added to existing methods for testing. Color based on % color visible regardless of leaf drop. Added % green. Leaf drop based on visual estimate rather than measures of density, transparency or dieback. Total of color, green and leaf drop to equal 100%.
#'
#' **no date**: Monitoring at Lye Brook: Red maple at 1400 feet in the Lye Brook Wilderness Area was added as a southern Vermont monitoring site.
#'
#' **no date**: Site description: Upper elevation site (2200 ft.) added in the Underhill State Park.
#'
#' **no date**: Site description West slope of Mount Mansfield in the Browns River watershed at low elevation site (1400 ft.) at the Proctor Maple Research Center
#'
#' @docType data
#'
#' @author
#' Joshua Halman: Principal Investigator
#'
#' Michael Johnson: Content Provider
#'
#' Tom Simmons: Content Provider
#'
#' Sandra Wilmot: Principal Investigator
#'
#' Barbara Schultz: Content Provider
#'
#' Sean Lawson: Content Provider
#'
#' Dan Dillner: Content Provider
#'
#' @source remotely readable csv:  https://query.data.world/s/6fhycjztl6c72mzpjrxfguca4xgufg?dws=00000
#'
#' This dataset was released by The Forest Ecosystem Monitoring Cooperative. It has been released into the Public Domain.
#'
#' @references Vermont Department of Forests, Parks and Recreation. 2015.
#' Yearly Fall Color Monitoring. FEMC.
#' Can be found at:
#' https://www.uvm.edu/femc/data/archive/project/tree-phenology-monitoring-fall-color-leaf/dataset/yearly-averages-by-species-fall-color
#'

"fallcolor"
"fallcolor_wide"
