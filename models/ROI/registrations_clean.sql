{{ config(materialized='table')}}


SELECT * from {{ source('POWERFLOW','registrations')}}
where user_id is not null