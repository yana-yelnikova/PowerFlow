{{ config(materialized='table')}}


SELECT * from {{ source('powerflow','registrations')}}
where user_id is not null