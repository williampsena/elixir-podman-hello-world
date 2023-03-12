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
    index = (Kernel.length(@fruits) - 1) |> :rand.uniform()
    fruit = Enum.at(@fruits, index)

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "What kind of fruit is that? #{fruit}")
  end
end

Logger.info("Starting application")

Plug.Adapters.Cowboy.http(Fruit.Plug, [], ip: {0, 0, 0, 0}, port: 3000)
