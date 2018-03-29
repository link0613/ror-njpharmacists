module PagesHelper


  def build_page_listing(page,is_root)
    return_val = ""
    
    if (is_root)
      return_val += "<li class='media'>"
    else
      return_val += "<div class='media'>"
    end
    
    return_val += "<a href='#' class='pull-left'>&nbsp;</a>"

    return_val += "<div class='media-body #{is_root ? 'media-root' : ''}'>"

      title =  "<h4 class='media-heading' style='display:inline-block;padding-top:2px;position:relative;top:3px;'>[#{page.id}] #{is_root ? '' : '- '} #{page.page_title.nil? ? 'Untitled Page' : page.page_title }  &nbsp;</h4>"

      if (!page.child_pages.empty?)
        return_val += "<a id='pg-#{page[:id]}' href=\"javascript:showSubpages('#{page[:id]}');\" class='show-pages btn btn-default btn-sm btn-link'>#{title}<span class='glyphicon glyphicon-chevron-up arrow-down'></span><span class='glyphicon glyphicon-chevron-down arrow-up'></span></a>"
      else
        return_val += title
      end
      
      return_val += "&nbsp;&nbsp;<div class='btn-group'>"
      return_val += "<a href='#{edit_page_path(page)}' class='btn btn-sm btn-primary' style='display:inline-block;'>Edit</a>"
      return_val += "<button type='button' class='btn btn-sm btn-primary dropdown-toggle' data-toggle='dropdown'><span class='caret'></span><span class='sr-only'>Toggle Dropdown</span></button>"
        return_val += "<ul class='dropdown-menu' role='menu'>"
          return_val += "<li><a href='#{page_callout_assignments_path(page)}' style='display:inline-block;'>Manage Callouts</a></li>"
          return_val += "<li><span class=''></span><a href='#{page.build_page_url}' style='display:inline-block;' target='_blank'>Preview</a></li>"
          return_val += "<li><a href='#{page_duplicate_path(page)}' style='display:inline-block;'>Duplicate</a></li>"
          return_val += "<li>#{link_to 'Delete',
                            page_path(page),
                            method: :delete,
                            data: { confirm: 'Are you sure?' },
                            style: 'display:inline-block;'}</li>"
        return_val += "</ul>"
      return_val += "</div>"

    return_val += "<div class='media-child'>"
    page.child_pages.each do |child|
      append_val = build_page_listing(child, false)
      if(!append_val.nil?)
        return_val += append_val
      end
    end
    return_val += "</div>"
    
    return_val += "</div>"
    
    if (is_root)
      return_val += "</li>"
    else
      return_val += "</div>"
    end
    
    return return_val
  end

end
