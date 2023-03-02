view: sample_data {
  sql_table_name: `eferreria.eaf_ds.sample_data`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name]
  }
}
