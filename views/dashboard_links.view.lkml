view: dashboard_links {


  dimension: rendered_nav_guide {
    label: "Dashboard Navigation"
    sql: 'Dashboard Navigation' ;;
    html:
    <div style="width:100%">
      <table style="table-layout:fixed;text-align:center; font-size:16px; width:100%; color:white">
        <tr>

        <!-- Start Here -->
        <td style="word-wrap:break-word; white-space:normal; text-align:center; width:14%; background-color:
        {% if current_dashboard._parameter_value == 'db_1' %} @{primary_blue} {% else %} @{secondary_blue} {% endif %}
        ">
          <a href="@{db_1_url}?@{region_selector}={{ _filters['custom_map.region_selector'] | url_encode}}">
          Dashboard 1 </a>
        </td>

        <!-- Hospital Comparison -->
        <td style="word-wrap:break-word; white-space:normal; text-align:center; width:14%; background-color:
        {% if current_dashboard._parameter_value == 'db_2' %} @{primary_blue} {% else %} @{secondary_blue} {% endif %}
        ">
          <a href="@{db_2_url}?@{region_selector}={{ _filters['custom_map.region_selector'] | url_encode}}">
          Dashboard 2 </a>
        </td>

        </tr>
      </table>
    </div>
    ;;
  }

  parameter: current_dashboard {
    type: unquoted
    allowed_value: { value: "db_1"}
    allowed_value: { value: "db_2"}
  }

}
