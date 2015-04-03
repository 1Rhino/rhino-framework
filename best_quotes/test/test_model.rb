require_relative 'test_helper'

class RhinoAppTest < Test::Unit::TestCase
  include Rhino::Model

  def test_load_model
    record = FileModel.find(1)
    assert_not_equal record, nil
  end

  def test_value_record
    record = FileModel.find(1)
    assert_equal record["submitter"], "1rhino"
    assert_equal record["not_exist_key"], nil
  end

  def test_load_nil_record
    record = FileModel.find(1_000_000)
    assert_equal record, nil
  end

  def test_load_all
    all_records = FileModel.all
    assert (all_records.count > 0)
  end

  def test_load_all_value
    all_records = FileModel.all
    assert_equal all_records.first["attribution"], "Ben Franklin"
  end

end
