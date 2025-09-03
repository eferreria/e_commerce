- dashboard: top_10_by_total_sales
  title: Top 10 by Total Sales
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Top 10 by Total Sales
    name: Top 10 by Total Sales
    model: thelook_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_revenue, order_items.total_orders, products.category]
    sorts: [order_items.total_revenue desc]
    limit: 10
    column_limit: 50
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
            id: order_items.total_revenue, name: Total Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_items.total_orders,
            id: order_items.total_orders, name: Total Orders}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      order_items.total_orders: line
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
