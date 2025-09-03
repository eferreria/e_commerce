- dashboard: region_map_by_county
  title: Region Map by County
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: SaEg3aus3pebdlvjEyAfeb
  elements:
  - title: Regional Map
    name: Regional Map
    model: thelook_dev
    explore: custom_map
    type: looker_map
    fields: [custom_map.city, custom_map.region_selector_filter, custom_map.county,
      custom_map.county_fips, hospital_locations.name, hospital_locations.hospital_location,
      custom_map.region_selector_color]
    filters:
      custom_map.state: Illinois,Indiana
      custom_map.region_selector_color: ">0"
      custom_map.market_region: "-NULL"
    sorts: [custom_map.region_selector_color desc]
    limit: 5000
    query_timezone: America/Halifax
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_marker_radius_fixed: 1000
    map_marker_color: [black]
    map_value_colors: ["#006400", "#ADD8E6", orange, yellow, pink, purple, blue, magenta,
      gold, violet]
    hidden_fields: [custom_map.city]
    defaults_version: 1
    listen:
      Region Selector: custom_map.region_selector
      Selected Region: custom_map.region_selector_filter
    row: 2
    col: 0
    width: 16
    height: 9
  - title: Hospital Info
    name: Hospital Info
    model: thelook_dev
    explore: custom_map
    type: looker_grid
    fields: [hospital_locations.health_system, hospital_locations.name, custom_map.market_region,
      hospital_locations.full_address, custom_map.county, custom_map.state, custom_map.covered_lives]
    filters:
      custom_map.state: Illinois,Indiana
      custom_map.market_region: "-NULL"
      hospital_locations.name: "-NULL"
    sorts: [hospital_locations.health_system]
    limit: 5000
    query_timezone: America/Halifax
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_marker_radius_fixed: 900
    hidden_fields: []
    defaults_version: 1
    series_types: {}
    listen:
      Region Selector: custom_map.region_selector
      Selected Region: custom_map.region_selector_filter
    row: 11
    col: 0
    width: 16
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <a href="/dashboards-next/779"> Region Map by Zip </a><br>
      <a href="/dashboards-next/780"> Region Map by County </a>
    row: 0
    col: 16
    width: 4
    height: 2
  - title: Systems
    name: Systems
    model: thelook_dev
    explore: custom_map
    type: looker_grid
    fields: [hospital_locations.health_system]
    filters:
      custom_map.state: Illinois,Indiana
      custom_map.market_region: "-NULL"
      hospital_locations.name: "-NULL"
      hospital_locations.health_system: ''
    sorts: [hospital_locations.health_system]
    limit: 5000
    column_limit: 50
    query_timezone: America/Halifax
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_marker_radius_fixed: 900
    hidden_fields: []
    defaults_version: 1
    series_types: {}
    listen:
      Region Selector: custom_map.region_selector
      Selected Region: custom_map.region_selector_filter
    row: 2
    col: 16
    width: 6
    height: 6
  - title: Region Selection
    name: Region Selection
    model: thelook_dev
    explore: custom_map
    type: looker_grid
    fields: [custom_map.region_selector_filter]
    filters:
      custom_map.state: Illinois,Indiana
      custom_map.market_region: "-NULL"
      hospital_locations.name: "-NULL"
      hospital_locations.health_system: ''
    sorts: [custom_map.region_selector_filter]
    limit: 5000
    column_limit: 50
    query_timezone: America/Halifax
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_marker_radius_fixed: 900
    hidden_fields: []
    defaults_version: 1
    series_types: {}
    listen:
      Region Selector: custom_map.region_selector
      Selected Region: custom_map.region_selector_filter
    row: 8
    col: 16
    width: 6
    height: 6
  - title: Dashboard Nav
    name: Dashboard Nav
    model: thelook_dev
    explore: custom_map
    type: single_value
    fields: [dashboard_links.rendered_nav_guide]
    filters:
      dashboard_links.current_dashboard: db^_2
    sorts: [dashboard_links.rendered_nav_guide]
    limit: 5000
    column_limit: 50
    query_timezone: America/Halifax
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_marker_radius_fixed: 900
    hidden_fields: []
    defaults_version: 1
    series_types: {}
    listen:
      Region Selector: custom_map.region_selector
    row: 0
    col: 0
    width: 16
    height: 2
  filters:
  - name: Region Selector
    title: Region Selector
    type: field_filter
    default_value: city
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: thelook_dev
    explore: custom_map
    listens_to_filters: []
    field: custom_map.region_selector
  - name: Selected Region
    title: Selected Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: thelook_dev
    explore: custom_map
    listens_to_filters: [Region Selector]
    field: custom_map.region_selector_filter