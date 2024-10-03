//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Todo{

    struct TodoList{
        string title;
        string description;
        bool isDone;
    }

    TodoList[] todoList;

    event TodoCreated();
    event TodoUpdated(uint256 indexed _index);

    function createTodolist(string memory _title, string memory _description) external{
        todoList.push(TodoList(_title, _description, false));

        emit TodoCreated();
    }

    function getAllTodoList() external view returns(TodoList[] memory){
        return todoList;
    }

    function getTodoList (uint256 _index) external view returns(TodoList memory){
        require(_index <= todoList.length -1, "Index out of bounds");
        return todoList[_index];
    }

    function updateStatus(uint256 _index) external{
        require(_index <= todoList.length -1, "Index out of bounds");
        TodoList storage td = todoList[_index];
        td.isDone = !td.isDone;

        emit TodoUpdated(_index);
    }


}