class Statement < ApplicationRecord
    validates :income, :expenditure, :month, presence: true
    before_save do
        self.total_income = save_totals(self.income)
        self.total_expenditure = save_totals(self.expenditure)
        puts self.total_income
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

end
