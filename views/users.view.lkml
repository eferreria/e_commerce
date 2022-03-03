view: users {
  # sql_table_name: `looker-private-demo.thelook.users`    ;;

  derived_table: {
    sql:
    select * from  `looker-private-demo.thelook.users`
    where
    {% if select_month._parameter_value == "'January'" %} ((( users.created_at  ) >= (TIMESTAMP('2022-01-01 00:00:00', 'America/Los_Angeles')) AND ( users.created_at  ) < (TIMESTAMP('2022-02-01 00:00:00', 'America/Los_Angeles'))))
    {% elsif select_month._parameter_value == "'February'" %} 1=2
    {% else %} 1=1
    {% endif %}

    ;;
  }

  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  parameter: select_month {
    type: string
    allowed_value: { value: "January" }
    allowed_value: { value: "February" }
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      month_name,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: since_created {
    type: duration
    sql_start: ${created_raw} ;;
    sql_end: current_date ;;
    datatype: datetime
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: gender_v2 {
    type: string
    case: {
      when: { label: "Male" sql: ${gender} = 'Male' ;;}
      when: { label: "Female" sql: ${gender} = 'Female' ;;}
      when: { label: "Non Binary" sql: ${gender} = 'Non Binary' ;;}
    }
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]

    html:
    Total Count: {{value}} <br>
    State: {{state._value}}
    ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      order_items.count,
      events.count,
      orders.count
    ]
  }
}
