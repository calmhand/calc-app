<template>
    <div class="calculator">
        <div v-if="display.length===0" class="display">0</div>
        <div v-if="display.length!=0" class="display">{{display.join("")}}</div>

        <!-- row 1 -->
        <opBtn @clear-calc="clearCalc" :operation="'C'" />
        <opBtn @negate="negate" :operation="'NEG'" />
        <opBtn @modulo="modulo" :operation="'%'" />
        <opBtn @divide="divide" :operation="'/'"/>

        <!-- row 2 -->
        <numBtn @returnVal="addToDisplay" :value="7" />
        <numBtn @returnVal="addToDisplay" :value="8" />
        <numBtn @returnVal="addToDisplay" :value="9" />
        <opBtn @multi="multi" :operation="'*'" />

        <!-- row 3 -->
        <numBtn @returnVal="addToDisplay" :value="4" />
        <numBtn @returnVal="addToDisplay" :value="5" />
        <numBtn @returnVal="addToDisplay" :value="6" />
        <opBtn @subtract="subtract" :operation="'-'" />

        <!-- row 4 -->
        <numBtn @returnVal="addToDisplay" :value="1" />
        <numBtn @returnVal="addToDisplay" :value="2" />
        <numBtn @returnVal="addToDisplay" :value="3" />
        <opBtn @add="add" :operation="'+'" />

        <!-- row 5 -->
        <opBtn/>
        <numBtn @returnVal="addToDisplay" :value="0" />
        <!-- <opBtn/> -->
        <opBtn @solve="solve" :operation="'='"/>
    </div>
</template>

<script>
    import opBtn from './OperatorButton.vue'
    import numBtn from './NumberButton.vue'

    export default {
        components: {
            opBtn,
            numBtn
        },
        data() {
            return {
                display: [],
                operation: "",
                fstNum: null,
                sndNum: null,
                solution: 0,
            }
        },
        methods: {
            clearCalc() {
                this.display = []
                this.setOperation("")
                this.fstNum = null
                this.sndNum = null
            },
            setOperation(op) {
                this.operation = op
                if (this.display.length != 0 && this.fstNum === null) {
                    this.fstNum = parseInt(this.display.join(""))
                    this.display = []
                } else {
                    this.display = []
                }
            },
            getOperation() {
                return this.operation
            },
            getFirstNum() {
                return parseInt(this.fstNum)
            },
            getSecondNum() {
                return parseInt(this.sndNum)
            },
            solve() {
                if (this.display.length != 0 && this.fstNum != null) {
                    this.sndNum = parseInt(this.display.join(""))
                }
                switch (this.getOperation()) {
                    case 'add':
                        this.add()
                        this.clearCalc()
                        this.fstNum = this.solution
                        this.addToDisplay(this.solution)
                        break;
                    case 'subtract':
                        this.subtract()
                        this.clearCalc()
                        this.fstNum = this.solution
                        this.addToDisplay(this.solution)
                        break;
                    case 'multi':
                        this.multi()
                        this.clearCalc()
                        this.fstNum = this.solution
                        this.addToDisplay(this.solution)
                        break;
                    case 'divide':
                        this.divide()
                        this.clearCalc()
                        this.fstNum = this.solution
                        this.addToDisplay(this.solution)
                        break;
                    case 'modulo':
                        this.modulo()
                        this.clearCalc()
                        this.fstNum = this.solution
                        this.addToDisplay(this.solution)
                        break;
                    
                    default:
                        break;
                }
            },
            addToDisplay(num) {
                this.display.push(num)
            },
            negate() {
                console.log('negate');
            },
            modulo() {
                if (this.getOperation().length === 0) {
                    this.setOperation("modulo")
                } else {
                    this.solution = this.getFirstNum() % this.getSecondNum()
                }
            },
            divide() {
                if (this.getOperation().length === 0) {
                    this.setOperation("divide")
                } else {
                    this.solution = this.getFirstNum() / this.getSecondNum()
                }
            },
            multi() {
                if (this.getOperation().length === 0) {
                    this.setOperation("multi")
                } else {
                    this.solution = this.getFirstNum() * this.getSecondNum()
                }
            },
            subtract() {
                if (this.getOperation().length === 0) {
                    this.setOperation("subtract")
                } else {
                    this.solution = this.getFirstNum() - this.getSecondNum()
                }
            },
            add() {
                if (this.getOperation().length === 0) {
                    this.setOperation("add")
                } else {
                    this.solution = this.getFirstNum() + this.getSecondNum()
                }
            },
        },
        emits: [
            'clear-calc', 'negate', 'modulo', 
            'divide', 'multi', 'subtract', 
            'add', 'solve'
        ],
    }
</script>

<style scoped>
    .calculator {
        font-size: 35px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: minmax(50px, auto);
        width: 300px;
        height: 400px;
        margin: 0px auto;
        border: 2px solid #fff
    }

    .display {
        grid-column: 1 / 5;
        background-color: #fff;
        border: solid #fff 2px;
    }
</style>