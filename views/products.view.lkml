view: products {
  sql_table_name: `looker-private-demo.thelook.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  filter: select_brand {
    type: string
    suggest_dimension: brand
  }

  dimension: selected_brand {
    sql:
    CASE WHEN {% condition select_brand %} ${brand} {% endcondition %} THEN ${brand}
    ELSE 'All Other Brands'
    END
    ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  parameter: select_dimension {
    type: unquoted
    allowed_value: { value: "category" label: "Category"}
    allowed_value: { value: "brand" label: "Brand"}
    allowed_value: { value: "name" label: "Product Name"}
  }

  dimension: dynamic_dimension {
    label_from_parameter: select_dimension
    sql:
    {% if select_dimension._parameter_value == 'category' %} ${category}
    {% elsif select_dimension._parameter_value == 'brand' %} ${brand}
    {% else %} ${name}
    {% endif %}
    ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }
}
