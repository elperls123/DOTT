defmodule CidrMaskConvertTest do
  use ExUnit.Case

  test "Test valid cidr to mask" do
    assert CidrMaskConvert.cidr_to_mask("128.0.0.0") == "1"
    assert CidrMaskConvert.cidr_to_mask("255.255.0.0") == "16"
    assert CidrMaskConvert.cidr_to_mask("255.255.248.0") == "21"
    assert CidrMaskConvert.cidr_to_mask("255.255.255.255") == "32"
  end

  test "Test valid mask to cidr" do
    assert CidrMaskConvert.mask_to_cidr("1") == "128.0.0.0"
    assert CidrMaskConvert.mask_to_cidr("16") == "255.255.0.0"
    assert CidrMaskConvert.mask_to_cidr("21") == "255.255.248.0"
    assert CidrMaskConvert.mask_to_cidr("32") == "255.255.255.255"
  end

  test "Test invalid cidr to mask" do
    assert CidrMaskConvert.cidr_to_mask("0") == "Invalid"
    assert CidrMaskConvert.cidr_to_mask(-1)  == "Invalid"
    assert CidrMaskConvert.cidr_to_mask(33)  == "Invalid"
  end

  test "Test invalid mask to cidr" do
    assert CidrMaskConvert.mask_to_cidr("0.0.0.0")     == "Invalid"
    assert CidrMaskConvert.mask_to_cidr("0.0.0.0.0")   == "Invalid"
    assert CidrMaskConvert.mask_to_cidr("255.255.255") == "Invalid"
    assert CidrMaskConvert.mask_to_cidr("11.0.0.0")    == "Invalid"
  end
end

defmodule IpValidateTest do
  use ExUnit.Case

  test "Test valid ipv4" do
    assert IpValidate.ipv4_validation("127.0.0.1") == true
    assert IpValidate.ipv4_validation("0.0.0.0") == true
    assert IpValidate.ipv4_validation("192.168.0.1") == true
    assert IpValidate.ipv4_validation("255.255.255.255") == true
  end

  test "Test invalid ipv4" do
    assert IpValidate.ipv4_validation('192.168.1.2.3') == false
    assert IpValidate.ipv4_validation('a.b.c.d') == false
    assert IpValidate.ipv4_validation('255.256.250.0') == false
    assert IpValidate.ipv4_validation('....') == false
  end

end
