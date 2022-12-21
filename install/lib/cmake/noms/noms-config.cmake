



#加载生成的.cmake文件 noms_FIND_COMPONENTS这个变量是find_package COMPONENTS后面的组件，具体可以查看cmake的这个变量
foreach (component ${noms_FIND_COMPONENTS})
    include(${CMAKE_CURRENT_LIST_DIR}/noms-${component}-config.cmake)
endforeach ()
