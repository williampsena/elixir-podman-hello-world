require Logger

defmodule Fruit.Plug do
  import Plug.Conn

  @fruits [
    "🥝",
    "🍓",
    "🥭",
    "🍍",
    "🍊",
    "🍋",
    "🍈",
    "🍑",
    "🍇",
    "🍉",
    "🥑",
    "🍅",
    "🍌",
    "🍐",
    "🍎",
    "🍏"
  ]

  def init(options), do: options

  def call(conn, _opts) do
    fruits_size = Kernel.length(@fruits)
    index = :rand.uniform(fruits_size - 1)
    fruit = Enum.at(@fruits, index)

    conn
    |> put_resp_content_type("text/plain">)
    |> send_resp(200, "What kind of fruit is that? #{fruit}")
  end
end

Logger.info("Starting application")

Plug.Adapters.Cowboy.http(Fruit.Plug, [], ip: {0, 0, 0, 0}, port: 3000)
