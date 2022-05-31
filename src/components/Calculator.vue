<template>
    <div class="calculator">
        <div class="display">{{result}}</div>

        <!-- row 1 -->
        <button @click="clearCalc()" class="option">C</button>
        <button @click="setOperation('signs')" class="option">+/-</button>
        <button @click="setOperation('mod')" class="option">%</button>
        <button @click="setOperation('div')" class="option">/</button>

        <!-- row 2 -->
        <button @click="setNum(7)">7</button>
        <button @click="setNum(8)">8</button>
        <button @click="setNum(9)">9</button>
        <button @click="setOperation('multi')" class="option">*</button>

        <!-- row 3 -->
        <button @click="setNum(4)">4</button>
        <button @click="setNum(5)">5</button>
        <button @click="setNum(6)">6</button>
        <button @click="setOperation('sub')" class="option">-</button>

        <!-- row 4 -->
        <button @click="setNum(1)">1</button>
        <button @click="setNum(2)">2</button>
        <button @click="setNum(3)">3</button>
        <button @click="setOperation('add')" class="option">+</button>

        <!-- row 5 -->
        <button></button>
        <button @click="setNum(0)">0</button>
        <button></button>
        <button @click="solve()" class="option">=</button>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                operation: "",
                firstNum: null,
                secondNum: null,
                result: 0
            }
        },
        methods: {
            setOperation(op) {
                this.operation = op
            },
            resetOperation() {
                this.operation = ""
            },
            clearCalc() {
                this.result = 0
                this.firstNum = null
                this.secondNum = null
                this.resetOperation()
            },
            setNum(num) {
                if (this.firstNum != null && this.operation != "") {
                    this.secondNum = num
                    this.result = num
                    console.log(this.firstNum);
                    console.log(this.secondNum);
                } else {
                    this.firstNum = num
                    this.result = num
                    console.log(this.firstNum);
                    console.log(this.secondNum);
                }
            },
            solve() {
                if (this.secondNum == null) {
                    this.result = this.firstNum
                } else {
                    switch(this.operation) {
                        case "add":
                            this.result = this.add(this.firstNum, this.secondNum)
                            this.firstNum = this.result
                            this.secondNum = null
                            this.resetOperation()
                            break; 
                        case "sub":
                            this.result = this.subtract(this.firstNum, this.secondNum)
                            this.firstNum = this.result
                            this.secondNum = null
                            this.resetOperation()
                            break; 
                        case "multi":
                            this.result = this.multiply(this.firstNum, this.secondNum)
                            this.firstNum = this.result
                            this.secondNum = null
                            this.resetOperation()
                            break; 
                        case "div":
                            this.result = this.divide(this.firstNum, this.secondNum)
                            this.firstNum = this.result
                            this.secondNum = null
                            this.resetOperation()
                            break; 
                        case "mod":
                            this.result = this.modulo(this.firstNum, this.secondNum)
                            this.firstNum = this.result
                            this.secondNum = null
                            this.resetOperation()
                            break; 
                    }
                }
            },
            modulo(firstOp, secondOp) {
                return firstOp % secondOp
            },
            divide(firstOp, secondOp) {
                return firstOp / secondOp
            },
            multiply(firstOp, secondOp) {
                return firstOp * secondOp
            },
            subtract(firstOp, secondOp) {
                return firstOp - secondOp
            },
            add(firstOp, secondOp) {
                return firstOp + secondOp
            },
        }
    }
</script>

<style scoped>
    .calculator {
        font-size: 35px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: minmax(50px, auto);
    }

    .display {
        grid-column: 1 / 5;
        background-color: lightgray;
        border: solid black 2px;
    }

    .option {
        background-color: rgb(245, 183, 69);
    }

</style>