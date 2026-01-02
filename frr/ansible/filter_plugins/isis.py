
def system_id(param_list):
  result = ""
  for ip_seg in param_list.split("."):
    result += f"{ip_seg:0>3}"
  
  return result[0:4] + "." + result[4:8] + "." + result[8:12]

def area(param_list):
  result = ""
  parts = str(param_list).split(".")
  result += f"{parts[0]:0>2}"
  result += "."
  result += f"{parts[1]:0>4}"
  return result

class FilterModule(object):
  def filters(self):
    return {
      'isis_system_id': system_id,
      'isis_area': area
    }
