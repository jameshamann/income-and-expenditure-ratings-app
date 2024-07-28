class Statement < ApplicationRecord
    validates :income, :expenditure, :month, presence: true
    belongs_to :user
    before_save do
        self.total_income = save_totals(self.income)
        self.total_expenditure = save_totals(self.expenditure)
        self.disposable_income = self.total_income - self.total_expenditure
        self.ratio = total_expenditure/total_income
        self.rating = return_rating
    end

   
    private
    
    def save_totals(data)
        totals = 0.00
        if data.length == 1
            totals = data["0"]['value']
        else
            data_arr = data.flatten
            totals = 0.00
            data_arr.each do |a|
                totals += a['value'].to_f
            end
        end
        return totals
    end

    def return_rating
        case self.ratio
        when 0..0.1
          "A"
        when 0.1..0.3
          "B"
        when 0.3..0.5
          "C"
        else
          "D"
        end
    end

    def self.search_by_month(date)
      if date.nil? || date.empty?
          self.all
      else 
          statement_month = date.to_date
          self.where(month: statement_month.beginning_of_month..statement_month.end_of_month)
      end
  end


end
