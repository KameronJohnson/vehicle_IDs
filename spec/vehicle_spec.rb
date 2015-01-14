require('rspec')
require('vehicle')

describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

  describe("#make") do
    it("returns the make of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.make()).to(eq("Toyota"))
    end
  end

  describe("#model") do
    it("returns the model of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.model()).to(eq("Prius"))
    end
  end

  describe("#year") do
    it("returns the year of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.year()).to(eq(2000))
    end
  end

  describe("#id") do
    it("returns the id of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a dealership to the array of saved vehicles") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(Vehicle.all()).to(eq([test_vehicle]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved vehicles") do
      Vehicle.new("Toyota", "Prius", 2000).save()
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a vehicle by its id number") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      test_vehicle2 = Vehicle.new("Toyota", "Corolla", 1999)
      test_vehicle2.save()
      expect(Vehicle.find(test_vehicle.id())).to(eq(test_vehicle))
    end
  end

  describe("#age") do
    it("returns the vehicle age") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      #test_vehicle is an instance of our Vehicle object
      expect(test_vehicle.age()).to(eq(15))
    end
  end

  describe("#worth_buying?") do
    it("returns false if vehicle is not american made and younger than 16 years") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      expect(test_vehicle.worth_buying?()).to(eq(false))
    end
  end
end
