require "./lib/caesar_cipher.rb"

describe Caesar do
  before { @caesar = Caesar.new }
  context "#caesar_cipher" do
    it "input string is empty" do
      expect(@caesar.caesar_cipher("", 5)).to eql("")
    end

    it "output string still remain if key = 0" do 
      expect(@caesar.caesar_cipher("What a string", 0)).to eql("What a string")
    end

    it "output string is modified" do
      expect(@caesar.caesar_cipher("What a string", 5)).to eql("Bmfy f xywnsl")
    end

    it "output string is modified if key is bigger than 26" do
      expect(@caesar.caesar_cipher("What a string", 31)).to eql("Bmfy f xywnsl")
    end

    it "character is still remain if it it number or quotation" do
      expect(@caesar.caesar_cipher("haha3131!!!", 5)).to eql("mfmf3131!!!")
    end
  end
end
