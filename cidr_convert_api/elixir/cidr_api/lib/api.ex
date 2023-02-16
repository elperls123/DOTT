defmodule Api.Endpoints do
  use Plug.Router

  plug :match
  plug Plug.Parsers,
    parsers: [:urlencoded, :json],
    json_decoder: Jason
  plug :dispatch

  #Just a health check """
  get "/" do
    send_resp(conn, 200, "OK")
  end

  # Just a health check
  get "_/health" do
    send_resp(conn, 200, "OK")
  end

  # e.g. http://127.0.0.1:8000/cidr-to-mask?value=8
  get "/cidr-to-mask" do
    val  = conn.params["value"]
    res  = %{
      "function" => "cidrToMask",
      "input" => val,
      "output" => CidrMaskConvert.cidr_to_mask(val)
    }

    {:ok, res } = Jason.encode(res)
    send_resp(conn, 200, res)
  end

  # # e.g. http://127.0.0.1:8000/mask-to-cidr?value=255.0.0.0
  get "/mask-to-cidr" do
    val  = conn.params["value"]
    res  = %{
      "function" => "maskToCidr",
      "input" => val,
      "output" => CidrMaskConvert.mask_to_cidr(val)
    }

    {:ok, res } = Jason.encode(res)
    send_resp(conn, 200, res)
  end

  # # e.g. http://127.0.0.1:8000/ip-validation?value=255.0.0.0
  get "/ip-validation" do
    val  = conn.params["value"]
    res  = %{
      "function" => "ipv4Validation",
      "input" => val,
      "output" => IpValidate.ipv4_validation(val)
    }
    {:ok, res } = Jason.encode(res)
    send_resp(conn, 200, res)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

end
