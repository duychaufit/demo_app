class Transaction < ApplicationRecord

    # ==Validates================>
    
    # duy: miss validate status
    # duy: status :kind, inclusion: {in: %w(aa bb cc)}

    #Debtorid
    validates :debtorid, presence: true, numericality: true
    #Amount
    validates :amount, presence: true, numericality: true, length: { maximum: 10 }
    #Date Debtor
    validates :datedebt, presence: true
    validate :check_input_date
    def check_input_date
    #     if datedebt > Time.zone.now
    #         errors.add(:datedebt, "must be after the start date")
    #     end
    end
    #Note
    validates :note, length: { maximum: 4 }, format: { with: /[,\s.]/ }
    # <===========================
    scope :getstatus, ->(array_status){ where('status in (?)', array_status) }
    scope :getnotstatus, ->(array_status){ where.not('status in (?)', array_status) }
    # ==GET LIST DEBTOR
    def self.show_debtor(session_id)
                    joins('inner join users on users.id = transactions.debtorid')
                    .select('fullname, sum(amount) as total,debtorid')
                    .where(creditorid: session_id)
                    .getstatus([1, 2]) # duy: magic number => use constant
                    .group(:fullname, :debtorid)
    end
    # ==GET LIST TRANSASTION OF A DEBTOT
    def self.details_debtor(session_id,debtor_id)
        where(creditorid: session_id, debtorid: debtor_id)
        .getstatus([1, 2])# duy: magic number => use constant
        .order("status asc")
    end
    # ==GET LIST CREDITOR
    def self.show_creditor(session_id)
        joins('inner join users on users.id = transactions.creditorid')
        .select('fullname, sum(amount) as total,creditorid')
        .where(debtorid: session_id)
        .getstatus([1, 2])# duy: magic number => use constant
        .group(:fullname, :creditorid)
    end
    # ==GET LIST TRANSACTION OF A CREDITOR
    def self.details_creditor(session_id,creditor_id)
        where(creditorid: creditor_id, debtorid: session_id)
        .getstatus([1, 2])
        .order("status asc")
    end
    # ==HISTORY
    def self.show_history(session_id)
        joins('inner join users on users.id = transactions.debtorid')\
        .select('*')
        .where(creditorid: session_id)
        .getnotstatus([1, 2])# duy: magic number => use constant
        .order("debtorid, status asc")
    end

end
