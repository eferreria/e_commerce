explore: hacker_news {}
view: hacker_news {
  derived_table: {
    sql: SELECT * FROM `bigquery-public-data.hacker_news.full` limit 6000
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: dead {
    type: yesno
    sql: ${TABLE}.dead ;;
  }

  dimension: by {
    type: string
    sql: ${TABLE}.`by` ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: parent {
    type: number
    sql: ${TABLE}.parent ;;
  }

  dimension: descendants {
    type: number
    sql: ${TABLE}.descendants ;;
  }

  dimension: ranking {
    type: number
    sql: ${TABLE}.ranking ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
  }

  set: detail {
    fields: [
      title,
      url,
      text,
      dead,
      by,
      score,
      time,
      timestamp_time,
      type,
      id,
      parent,
      descendants,
      ranking,
      deleted
    ]
  }
}
