#' Notaufnahme-Besuche wegen Hitze-Syndrom
#'
#' This contains data on heat syndrome emergency department visits, and max daily temperature.
#'
#' @author New York City Department of Health & Mental Hygiene
#'
#' @format 3 Variablen und 918 Beobachtungen
#' \itemize{
#'  \item enddate: date
#'  \item edvisits: amount of daily visits in the emergency department with heat syndrome
#'  \item maxtemp: The maximum daily temperature is the heat index or temperature, whichever is higher, as recorded by the National Weather Service weather station at La Guardia Airport.
#' }
#'
#' @details
#' The heat syndrome is identified in surveillance data by looking for diagnostic codes for heat-related illness and by searching chief complaints (descriptions of why patients are at the ED) for words related to heat, such as overheating, sunstroke, and similar terms.
#'
#' Syndrome data are inherently non-specific and are not based on diagnostic testing. While the NYC syndromic surveillance system captures data on 100% of ED visits in the city (as of 5/1/16), the data are not comprehensive because some residents seek care outside the city. These data are not exact measures and should be used to understand trends, rather than to count cases. In addition, recent data are not final and are subject to change.
#'
#' Tracking heat-related illness (HRI) in near-real time can help provide situational awareness, supplementing the weather forecast as an indicator of public health risk. HRI detected in emergency department syndromic surveillance data are strongly associated with hot weather and highly correlated with daily counts of HRI hospital discharge data. However, HRI counts detected in the ED syndromic surveillance data represent suspected rather than confirmed illness and is useful to track trends. Some records may be counted as cases when they are not HRI, while other HRI cases may go undetected due to differences in hospital coding practices or because of what patients say when they describe what is bothering them.
#'
#' @docType data
#'
#' @source remotely readable csv:  https://static.dwcdn.net/data/ECKxz.csv
#'
#' Github: https://github.com/nychealth/heat-syndrome-data
#'
#' @references https://a816-dohbesp.nyc.gov/IndicatorPublic/beta/key-topics/climatehealth/syndromic/
#'

"heated"
