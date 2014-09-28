require_relative "../lib/block_io"

gem "minitest"
require "minitest/autorun"

describe "Given a new key" do
  before do
    @k = BlockIo::Key.new
  end

  describe "when initialized" do  
    it "must return a BlockIo::Key" do
      @k.is_a?(BlockIo::Key).must_equal true
    end
  end
end

describe "Given a Preset key" do
  before do
  @k = BlockIo::Key.new("6b0e34587dece0ef042c4c7205ce6b3d4a64d0bc484735b9325f7971a0ead963")
  end

  describe "when initializing a key" do
    it "must derive the correct pubkey" do
      @k.public_key.must_equal "029c06f988dc6b44696e002e8abf496a13c73c2f1db3bde2dfb69be129f3711b01"
    end
  end

  describe "when signing data" do
    before do
      @sig = @k.sign("feedfacedeadbeeffeedfacedeadbeeffeedfacedeadbeeffeedfacedeadbeef")
    end

    it "must return the correct signature" do
      @sig.must_equal "3045022100b633aaa7cd5b7af455211531f193b61d34d20fe5ea19d23dd40d6074126150530220676617cd427db7d85923ebe4426ccecc47fb5826e3e24b60e62244e2a4811086"
    end
  end
end

describe "Given a PIN" do
  before do
    @pin = "123456"
  end

  describe "when derived into an AES key" do
    before do
      @kc = BlockIo::Helper.pinToAesKey(@pin)
    end

    it "must return the correct key" do
      @kc.must_equal "0EeMOVtm5YihUYzdCNgleqIUWkwgvNBcRmr7M0t9GOc="
    end
  end
end

describe "Given a passphrase" do
  before do
    @pass = "deadbeeffeedface"
  end

  describe "when creating a keypair" do
    before do
      @k = BlockIo::Key.from_passphrase(@pass)
    end

    it "must return a BlockIo::Key" do
      @k.is_a?(BlockIo::Key).must_equal true
    end

    it "must return the right private key" do
      @k.private_key.must_equal "ae9f07f3d627531db09562bbabad4c5e023f6505b4b06122730744261953e48f"
    end

    it "must return the correct public key" do
      @k.public_key.must_equal "029023d9738c623cdd7e5fdd0f41666accb82f21df5d27dc5ef07040f7bdc5d9f5"
    end
  end
end
