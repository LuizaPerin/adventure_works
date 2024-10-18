with

source as (
    select *
    from {{ source('raw-data','salesorderheader') }}
)

, renamed as (
    select
        SalesOrderID as sales_order_id
        , RevisionNumber as revision_number
        , OrderDate as order_date
        , DueDate as due_date
        , ShipDate as ship_date
        , Status
        , OnlineOrderFlag as oline_order_flag
        , PurchaseOrderNumber as purchase_order_number
        , AccountNumber as account_number
        , CustomerID as customer_id
        , SalesPersonID as sales_person_id
        , TerritoryID as territory_id
        , BillToAddressID as bill_to_address_id
        , ShipToAddressID as ship_to_address_id
        , ShipMethodID as ship_method_id
        , CreditCardID as credit_card_id
        , CreditCardApprovalCode as credit_card_approval_code
        , CurrencyRateID as currency_rate_id
        , SubTotal as sub_total
        , TaxAmt as tax_amt
        , Freight
        , TotalDue as total_due
        , Comment
        , rowguid
        , ModifiedDate as modified_date
    from source
)

select * from renamed
