include: "/views/order_items.view"
include: "/explores/order_items.explore"
include: "calendar_dim.view"

view: +order_items {

# -- POP
# {
# parameter: choose_breakdown {
#   label: "Choose Grouping (Rows)"
#   view_label: "_PoP"
#   type: unquoted
#   default_value: "Month"
#   allowed_value: {label: "Month Name" value:"Month"}
#   allowed_value: {label: "Day of Year" value: "DOY"}
#   allowed_value: {label: "Day of Month" value: "DOM"}
#   allowed_value: {label: "Day of Week" value: "DOW"}
#   allowed_value: {label: "This Month" value:"current_month"}
#   allowed_value: {label: "This Quarter" value:"current_qtr"}
#   allowed_value: {label: "This Year" value:"current_yr"}
#   allowed_value: {label: "Last 30 Days" value:"30days"}
#   allowed_value: {label: "Last 90 Days" value:"90days"}
#   allowed_value: {label: "Last 180 Days" value:"180days"}
#   allowed_value: {label: "Previous Month" value:"prev_month"}
#   allowed_value: {label: "Previous Quarter" value:"prev_qtr"}
#   allowed_value: {label: "Previous Year" value:"prev_year"}
#   allowed_value: {value: "Date"}
# }

# parameter: choose_comparison {
#   label: "Choose Comparison (Pivot)"
#   view_label: "_PoP"
#   type: unquoted
#   default_value: "Year"
#   allowed_value: {value: "Year" }
#   allowed_value: {value: "Month"}
#   allowed_value: {value: "Week"}
# }

#   dimension: pop_row  {
#     view_label: "_PoP"
#     label_from_parameter: choose_breakdown
#     type: string
#     order_by_field: sort_by1 # Important
#     sql:
#         {% if choose_breakdown._parameter_value == 'Month' %} ${created_month_name}
#         {% elsif choose_breakdown._parameter_value == 'DOY' %} ${created_day_of_year}
#         {% elsif choose_breakdown._parameter_value == 'DOM' %} ${created_day_of_month}
#         {% elsif choose_breakdown._parameter_value == 'DOW' %} ${created_day_of_week}
#         {% elsif choose_breakdown._parameter_value == 'Date' %} ${created_date}
#         {% elsif choose_breakdown._parameter_value == 'current_month' %} 'Current Month'
#         {% elsif choose_breakdown._parameter_value == 'current_qtr' %} 'Current Quarter'
#         {% elsif choose_breakdown._parameter_value == 'current_yr' %} 'Current Year'
#         {% elsif choose_breakdown._parameter_value == '30days' %} 'Last 30 Days'
#         {% elsif choose_breakdown._parameter_value == '90days' %} 'Last 90 Days'
#         {% elsif choose_breakdown._parameter_value == '180days' %} 'Last 180 Days'
#         {% else %}NULL{% endif %} ;;
#   }

#   dimension: pop_pivot {
#     view_label: "_PoP"
#     label_from_parameter: choose_comparison
#     type: string
#     order_by_field: sort_by2 # Important
#     sql:
#         {% if choose_comparison._parameter_value == 'Year' %} ${created_year}
#         {% elsif choose_comparison._parameter_value == 'Month' %} ${created_month_name}
#         {% elsif choose_comparison._parameter_value == 'Week' %} ${created_week}
#         {% else %}NULL{% endif %} ;;
#   }

#   dimension: sort_by1 {
#     hidden: yes
#     type: number
#     sql:
#         {% if choose_breakdown._parameter_value == 'Month' %} ${created_month_num}
#         {% elsif choose_breakdown._parameter_value == 'DOY' %} ${created_day_of_year}
#         {% elsif choose_breakdown._parameter_value == 'DOM' %} ${created_day_of_month}
#         {% elsif choose_breakdown._parameter_value == 'DOW' %} ${created_day_of_week_index}
#         {% elsif choose_breakdown._parameter_value == 'Date' %} ${created_date}
#         {% else %}NULL{% endif %} ;;
#   }

#   dimension: sort_by2 {
#     hidden: yes
#     type: string
#     sql:
#         {% if choose_comparison._parameter_value == 'Year' %} ${created_year}
#         {% elsif choose_comparison._parameter_value == 'Month' %} ${created_month_num}
#         {% elsif choose_comparison._parameter_value == 'Week' %} ${created_week}
#         {% else %}NULL{% endif %} ;;
#   }
# --}
}


# ---------- EXPLORE ---------- #

explore: +order_items {

  # always_join: [calendar_dim]

  join: calendar_dim {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items.created_date} = ${calendar_dim.calendar_date} ;;
  }

}
