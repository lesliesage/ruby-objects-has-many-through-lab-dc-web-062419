require_relative "./appointment.rb"
require_relative "./doctor.rb"

class Patient

  attr_accessor :name, :date, :doctor

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor,date)
    Appointment.new(date,self,doctor)
  end

  def appointments
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors
    appointments.map {|appointment| appointment.doctor}
  end

end
