class Merchant < ApplicationRecord
    has_many :items
    has_many :invoices

    validates_presence_of :name

    def self.search_merchants(name)
        where('name ILIKE ?', "%#{name}%")
        .order(:name)
        .first
    end

    def self.top_merchants_by_revenue(quantity)
        joins(invoices: [:invoice_items, :transactions])
        .where(transactions: {result: 'success'}, invoices: {status: 'shipped'})
        .select(:name, :id, 'SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
        .group(:id)
        .order(revenue: :desc)
        .limit(quantity)
    end

    def self.most_items(items)
        joins(invoices: [:transactions, :invoice_items])
        .where(transactions: {result: 'success'}, invoices: {status: 'shipped'})
        .select('merchants.*, SUM(invoice_items.quantity) AS count')
        .group(:id)
        .order(count: :desc)
        .limit(items)
    end
end
