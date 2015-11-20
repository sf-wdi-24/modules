# THIS FILE PERFORMS RSPEC TESTS ON `username.rb`
# TO RUN YOUR TESTS TYPE: `rspec spec/username_spec.rb`

require "./username.rb"

describe "#format_name" do

  it "combines the first letter of the first name with the last name" do
    expect( format_name("nathan", "allen") ).to eq "nallen"
    expect( format_name("justin", "castilla") ).to eq "jcastilla"
    expect( format_name("ilias", "tsangaris") ).to eq "itsangaris"
  end

  it "returns a lowercase string" do
    expect( format_name("Nathan", "Allen") ).to eq "nallen"
    expect( format_name("Justin", "Castilla") ).to eq "jcastilla"
    expect( format_name("ILIAS", "TSANGARIS") ).to eq "itsangaris"
  end

  it "removes extraneous whitespace" do
    expect( format_name("nathan" , " allen ") ).to eq "nallen"
    expect( format_name(" justin " , "castilla") ).to eq "jcastilla"
    expect( format_name("mary lou", "smith jones") ).to eq "msmithjones"
  end

  it "handles empty strings" do
    expect( format_name("nathan", "") ).to eq nil
    expect( format_name("", "") ).to eq nil
    expect( format_name("", "allen") ).to eq nil
  end

  it "removes special characters in strings (BONUS)" do
    expect( format_name("Nathan", "Allen!") ).to eq "nallen"
    expect( format_name(" Ilias ", "%20Tsangaris") ).to eq "itsangaris"
    expect( format_name("'Justin'", "Ca-sti-lla.") ).to eq "jcastilla"
  end

end

describe "#format_year" do

  it "returns a string" do
    expect( format_year(1945).class ).to be String
  end

  it "parses out the last two digits of YYYY" do
    expect( format_year(1945) ).to eq "45"
    expect( format_year(2000) ).to eq "00"
    expect( format_year(2007) ).to eq "07"
  end

  it "requires the year to have four digits: YYYY" do
    expect( format_year(45) ).to eq nil
    expect( format_year(123) ).to eq nil
    expect( format_year(20111) ).to eq nil
  end

end

describe "#check_privilege" do
  let (:user_types) { ["user", "seller", "manager", "admin"] }


  it "returns the corresponding user type" do
    user_types.each_with_index do |utype, i|
      expect( check_privilege(i) ).to eq utype
    end
  end

  it "defaults to the 'user' user type" do
    expect( check_privilege ).to eq user_types[0]
  end

  it "rounds down to the closest match" do
    expect( check_privilege(10) ).to eq "admin"
    expect( check_privilege(100) ).to eq "admin"
    expect( check_privilege(3.14159) ).to eq "admin"
    expect( check_privilege(1.7) ).to eq "seller"
    expect( check_privilege(2.9) ).to eq "manager"
  end

end

describe "#user_type_prefix" do

  it "returns the corresponding user type, ending with a dash" do
      expect( user_type_prefix(1) ).to start_with("seller").and end_with("-")
      expect( user_type_prefix(2) ).to start_with("manager").and end_with("-")
      expect( user_type_prefix(3) ).to start_with("admin").and end_with("-")
  end

  it "does not return a 'user-' prefix, just an empty string" do
      expect( user_type_prefix(0) ).not_to eq "user-"
      expect( user_type_prefix(0) ).to eq ""
  end

end

describe "#build_username" do

  it "adds the last two digits of the birth year to the username" do
    expect( build_username("john", "doe", 1945) ).to start_with("jdoe").and end_with("45")
    expect( build_username("john", "doe", 2000) ).to eq "jdoe00"
    expect( build_username("john", "doe", 2001) ).to eq "jdoe01"
  end

  it "prefixes usernames with a user_type" do
    expect( build_username("john", "doe", 1945, 1) ).to start_with("seller").and end_with("jdoe45")
    expect( build_username("john", "doe", 1945, 2) ).to start_with("manager").and end_with("jdoe45")
    expect( build_username("john", "doe", 1945, 3) ).to start_with("admin").and end_with("jdoe45")
  end

  it "separates the user_type from the user_name with a dash" do
    expect( build_username("jane", "dawson", 1945, 1) ).to eq "seller-jdawson45"
    expect( build_username("jane", "dawson", 1945, 2) ).to eq "manager-jdawson45"
    expect( build_username("jane", "dawson", 1945, 3) ).to eq "admin-jdawson45"
  end

  it "does not prefix level 0 usernames with 'user'" do
    expect( build_username("James", "Smith", 1945, 0) ).not_to start_with("user")
    expect( build_username("James", "Smith", 1945, 0) ).to eq "jsmith45"
  end

  it "defaults to type 'user' if no privilege level is specified" do
    expect( build_username("Jill", "Juniper", 2001) ).to eq "jjuniper01"
  end

end


describe "#generate_username" do

  it "it appends a username count when the username already exists" do
    expect( generate_username("King", "Kong", 1980) ).to eq "kkong80"
    expect( generate_username("King", "Kong", 1980) ).to end_with("_1")
  end

  it "it increments usernames that are already in use (uniqueness constraint)" do
    expect( generate_username("Jack", "Cole", 1999) ).to eq "jcole99"
    expect( generate_username("Jack", "Cole", 1999) ).to eq "jcole99_1"
    expect( generate_username("Jack", "Cole", 1999) ).to eq "jcole99_2"
    expect( generate_username("Jack", "Cole", 1999) ).to eq "jcole99_3"
  end

end
