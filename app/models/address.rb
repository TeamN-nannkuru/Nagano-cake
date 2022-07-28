class Address < ApplicationRecord
    belongs_to :customer
    
    validates :postal_code, :receriver_name, :ordered_address, presence: true
    
  def address_all
      self.postal_code+' '+self.ordered_address+' '+self.receriver_name
  end
    def address_display
        '〒' + postal_code + ' ' + address + ' ' + name
    end
    
end
