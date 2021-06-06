defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_year_secs = 31557600

    case planet do
      :mercury ->
        (seconds / earth_year_secs) / 0.2408467
      :venus ->
        (seconds / earth_year_secs) / 0.61519726
      :earth ->
        seconds / earth_year_secs
      :mars ->
        (seconds / earth_year_secs) / 1.8808158
      :jupiter ->
        (seconds / earth_year_secs) / 11.862615
      :saturn ->
        (seconds / earth_year_secs) / 29.447498
      :uranus ->
        (seconds / earth_year_secs) / 84.016846
      :neptune ->
        (seconds / earth_year_secs) / 164.79132
    end
  end
end
