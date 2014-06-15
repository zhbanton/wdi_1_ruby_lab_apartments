# has an address
# has many apartments
# the list of apartments should not be modified directly (bonus: actually prevent it from being modified directly)
# has a method to add an apartment
# has a method to remove a specific apartment by its number, which raises an error if the number is not found or the apartment currently has any tenants (bonus: allow overriding this constraint)
# has a total square footage, calculated from all apartments
# has a total monthly revenue, calculated from all apartment rents
# has a list of tenants, pulled from the tenant lists of all apartments
# has a method to retrieve all apartments grouped by credit rating (bonus: sort the groups by credit score)

class Building

  def initialize(address)
    @address = address
    @apartments = []
  end

  def add_apartment(apartment)
    @apartments << apartment
  end

  def remove_apartment(apt_number)
    if (@apartments.reject { |apartment| apt_number == apartment.number }) == @apartments
      raise "No apartment with that number found"
    elsif !(@apartments.reject! { |apartment| (apt_number == apartment.number && apartment.tenants.length != 0) } )
      puts "That apartment still has tenants.  Are you sure you want to remove it? y/n"
      if gets[0] == "y"
        @apartments.reject! { |apartment| apt_number == apartment.number }
      end
    end
  end
end