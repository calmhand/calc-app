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
        <numBtn @returnVal="addToDisplay" :value="0" />
        <opBtn @decimal="fraction" :operation="'.'"/>
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
                negation: false,
                fractioned: false,
                fstNum: null,
                sndNum: null,
                solution: 0,
            }
        },
        methods: {
            clearCalc() {
                this.setOperation("")
                this.display = []
                this.fstNum = null
                this.sndNum = null
                this.negation = false
                this.fractioned = false
            },
            setOperation(op) {
                if (op != "") {
                    this.operation = op
                    if (this.display.length != 0 && this.fstNum === null) {
                        this.fstNum = (() => {
                            if (!this.negation) {
                                return parseFloat(this.display.join(""))
                            } else {
                                this.display.shift()
                                this.negation = false
                                return parseFloat(this.display.join("")) * (-1.0)
                            }
                        })
                        this.fstNum = this.fstNum()
                        this.fractioned = false
                        this.display = []
                    } else {
                        this.display = []
                    }
                } else {
                    this.operation = op
                }
            },
            getOperation() {
                return this.operation
            },
            getFirstNum() {
                return parseFloat(this.fstNum)
            },
            getSecondNum() {
                return parseFloat(this.sndNum)
            },
            solve() {
                console.log(this.fstNum);
                if (this.display.length != 0 && this.fstNum != null) {
                    this.sndNum = (() => {
                            if (!this.negation) {
                                return parseFloat(this.display.join(""))
                            } else {
                                this.display.shift()
                                return parseFloat(this.display.join("")) * (-1.0)
                            }
                        })
                    this.sndNum = this.sndNum()
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
                if (this.display.length === 0 && num === 0) {
                    return null
                } else {
                    this.display.push(num)
                }
            },
            fraction() {
                if (this.display.length === 0) {
                    this.display.push('0')
                    this.display.push('.')
                    this.fractioned = true
                } else if (!this.fractioned) {
                    this.fractioned = true
                    this.display.push('.')
                }
            },
            negate() {
                if (this.display.length === 0) {
                    this.negation = false
                } else if (!this.negation) {
                    this.display.unshift("-")
                    this.negation = true
                } else if (this.negation) {
                    this.display.shift()
                    this.negation = false
                }
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
        row-gap: 1rem;
        column-gap: 1rem;
        width: 300px;
        height: 400px;
        margin: 10vh auto;
    }

    .display {
        grid-column: 1 / 5;
        color: #fff;
    }
</style>