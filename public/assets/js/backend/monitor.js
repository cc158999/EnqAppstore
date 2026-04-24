define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'monitor/index' + location.search,
                    add_url: 'monitor/add',
                    del_url: 'monitor/del',
                    multi_url: 'monitor/multi',
                    table: 'monitor',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'udid', title: __('UDID设备码')},
                        {field: 'identity', title:'身份'},
                        {field: 'count', title:'异常请求次数'},
                        {field: 'addtime', title: __('首次记录时间'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, buttons: [{
                            name: 'offline',
                            text: __('拉黑'),
                            icon: 'fa fa-list',
                            confirm:function (row) {
                                return '是否拉黑？';
                            },
                            success:function (data,ret) {

                            },
                            classname: 'btn btn-xs btn-warning btn-ajax',
                            url: 'monitor/black?ids={ids}'
                        }], formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});