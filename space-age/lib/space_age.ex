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
        seconds / (0.2408467 / earth_year_secs)
      :venus ->
        seconds / (0.61519726 / earth_year_secs)
      :earth ->
        seconds / earth_year_secs
      :mars ->
        seconds / (1.8808158 / earth_year_secs)
      :jupiter ->
        seconds / (11.862615 / earth_year_secs)
      :saturn ->
        seconds / (29.447498 / earth_year_secs)
      :uranus ->
        seconds / (84.016846 / earth_year_secs)
      :neptune ->
        seconds / (164.79132 / earth_year_secs)
    end
  end
end
