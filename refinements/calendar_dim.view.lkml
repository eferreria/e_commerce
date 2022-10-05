view: calendar_dim {
  label: "Calendar"
  derived_table: {
    sql:
      SELECT calendar_date FROM
        (
          SELECT DATE_ADD(date_add(date_trunc(current_date(), year), INTERVAL 1 YEAR),INTERVAL -param DAY) AS calendar_date
          FROM unnest(GENERATE_ARRAY(0, 1825, 1)) as param
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
