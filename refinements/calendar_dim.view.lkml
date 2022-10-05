# { DOCUMENTATION
# Copyright 2022 Google. This software is provided as-is, without warranty or representation for any use or purpose.
# Your use of it is subject to your agreement with Google.
#
# Description: Looker generates filter context based on the field type. For Date Type Fields, end users
# can get confused or query the wrong dates unintentionally due to the many options presented in the filter context
# The goal of this LookML File is to create a workaround using a standalone view and use this to filter a specific date
# from a target explore
#
# This LookML File will generate a calendar table
# It is defaulted to generate all the days of the Current Calendar Year, + 4 years back,
# for a total of 5 complete years including the current year
# this can be adjusted by change the constants in the GENERATE_ARRAY function
# Note that this has been tested only in BigQuery SQL Dialect
#
# Use the calendar_dim view as an inner join to any explore that users asks for a curated date filter
# The example below will join the calendar_dim to the order_items explore that is commonly referenced in Looker Training
# always_join: [calendar_dim]

# join: calendar_dim {
#   type: inner
#   relationship: many_to_one
#   sql_on: ${order_items.created_date} = ${calendar_dim.calendar_date} ;;
# }
# -- END DOCUMENTATION }

view: calendar_dim {
  label: "Calendar"
  derived_table: {
    sql:
      SELECT calendar_date FROM
        (
          SELECT DATE_ADD(date_add(date_trunc(current_date(), year), INTERVAL 1 YEAR),INTERVAL -param DAY) AS calendar_date
          FROM unnest(GENERATE_ARRAY(1, 1826, 1)) as param
        )
      WHERE
        {% if calendar_filter._parameter_value == 'current_month' %}
          calendar_date <= current_date and calendar_date >= date_trunc(current_date, MONTH)
        {% elsif calendar_filter._parameter_value == 'current_qtr' %}
          calendar_date <= current_date and calendar_date >= date_trunc(current_date, QUARTER)
        {% elsif calendar_filter._parameter_value == 'current_yr' %}
          calendar_date <= current_date and calendar_date >= date_trunc(current_date, YEAR)
        {% elsif calendar_filter._parameter_value == '30days' %}
          calendar_date <= current_date and calendar_date >= date_add(current_date, INTERVAL -29 DAY)
        {% elsif calendar_filter._parameter_value == '90days' %}
          calendar_date <= current_date and calendar_date >= date_add(current_date, INTERVAL -89 DAY)
        {% elsif calendar_filter._parameter_value == '180days' %}
        calendar_date <= current_date and calendar_date >= date_add(current_date, INTERVAL -179 DAY)
        {% elsif calendar_filter._parameter_value == 'prev_month' %}
          date_trunc(calendar_date, MONTH) =  date_trunc(date_add(current_date, INTERVAL -1 MONTH), MONTH)
        {% elsif calendar_filter._parameter_value == 'prev_qtr' %}
          date_trunc(calendar_date, QUARTER) =  date_trunc(date_add(current_date, INTERVAL -1 QUARTER), QUARTER)
        {% elsif calendar_filter._parameter_value == 'prev_yr' %}
          date_trunc(calendar_date, YEAR) =  date_trunc(date_add(current_date, INTERVAL -1 YEAR), YEAR)
        {% else %}1=1{% endif %}
      ;;
  }

  parameter: calendar_filter {
  label: "Date Filter"
  view_label: " Calendar Date Filter"
  type: unquoted
  default_value: "current_month"
  allowed_value: {label: "This Month" value:"current_month"}
  allowed_value: {label: "This Quarter" value:"current_qtr"}
  allowed_value: {label: "This Year" value:"current_yr"}
  allowed_value: {label: "Last 30 Days" value:"30days"}
  allowed_value: {label: "Last 90 Days" value:"90days"}
  allowed_value: {label: "Last 180 Days" value:"180days"}
  allowed_value: {label: "Previous Month" value:"prev_month"}
  allowed_value: {label: "Previous Quarter" value:"prev_qtr"}
  allowed_value: {label: "Previous Year" value:"prev_yr"}
}

  dimension: calendar_date {
    type: date
    sql: ${TABLE}.calendar_date ;;
    primary_key: yes
    hidden: yes
  }

}
