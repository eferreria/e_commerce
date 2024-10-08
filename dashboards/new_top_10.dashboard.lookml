- dashboard: new_top_10_by_total_sales
  title: New Top 10 by Total Sales
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Top 10 by Total Sales
    name: Top 10 by Total Sales
    model: thelook_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_revenue, products.dynamic_dimension]
    filters: {}
    sorts: [order_items.total_revenue desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Select Dimension: products.select_dimension
    row: 0
    col: 0
    width: 24
    height: 12
  - title: Top 10 by Total Sales (Copy)
    name: Top 10 by Total Sales (Copy)
    model: thelook_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_revenue, products.dynamic_dimension]
    filters: {}
    sorts: [order_items.total_revenue desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Select Dimension: products.select_dimension
    row: 12
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: thelook_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_revenue, products.dynamic_dimension]
    filters:
      products.select_dimension: category
    sorts: [order_items.total_revenue desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 12
    col: 8
    width: 8
    height: 6
  - name: Top Sales
    title: Top Sales
    model: thelook_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_revenue, products.dynamic_dimension, order_items.total_orders]
    filters:
      products.select_dimension: category
    sorts: [order_items.total_revenue desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_revenue,
            id: order_items.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.total_orders,
            id: order_items.total_orders, name: Total Orders}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      order_items.total_orders: line
    defaults_version: 1
    hidden_fields: []
    row:
    col:
    width:
    height:
  filters:
  - name: Select Dimension
    title: Select Dimension
    type: field_filter
    default_value: category
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: thelook_dev
    explore: order_items
    listens_to_filters: []
    field: products.select_dimension
