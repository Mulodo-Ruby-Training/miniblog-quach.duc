# encoding: utf-8
require 'spec_helper'

def find_and_destroy(class_entry, obj_entry)
  class_entry = class_entry.constantize
  if class_entry.find_by_id(obj_entry)
    class_entry.destroy(obj_entry)
  end
end