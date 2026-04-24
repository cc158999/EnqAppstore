define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'kami/index' + location.search,
                    add_url: 'kami/add',
                    edit_url: 'kami/edit',
                    del_url: 'kami/del',
                    multi_url: 'kami/multi',
                    table: 'kami',
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
                        {field: 'kami', title: __('Kami')},
                        {field: 'udid', title: __('Udid')},
						{field: 'kmyp', title: __('Kmyp'),searchList: {1: '月卡', 2: '季卡', 3: '年卡', 4: '日卡', 5: '周卡'},formatter: Table.api.formatter.flag},
                        {field: 'jh', title: __('Jh'),searchList: {0: '未激活', 1: '已激活'}, formatter: Table.api.formatter.label},
                        {field: 'addtime', title: __('Addtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'usetime', title: __('Usetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'endtime', title: __('Endtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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