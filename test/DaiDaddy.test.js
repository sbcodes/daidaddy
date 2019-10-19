// Import all required modules from openzeppelin-test-helpers
const {
    BN,
    constants,
    expectEvent,
    expectRevert
} = require("openzeppelin-test-helpers");
const {
    expect
} = require("chai");

// Contracts
const DaiDaddy = artifacts.require("./DaiDaddy.sol");
const SaiTub = artifacts.require("./SaiTub.sol");

// Cup constants(taken to mimic a deployed CDP from Etherscan)
const cupId = "0x0000000000000000000000000000000000000000000000000000000000001b4e";
const lad = "0xa8b462dab3eaaa7079c1b9031608f42188cef2f8"
const ink = "999843601236543264"
const art = "50000000000000000000"
const ire = "46444817854684944253"
const tab = "50000000000000000000"
const rap = "1937914497665704"

// Sale settings
const discount = "5"

contract("DaiDaddy", ([contractOwner, seller, buyer, random]) => {
    beforeEach(async function () {
        this.saiTub = await SaiTub.new(
            cupId,
            // lad,
            seller,
            ink,
            art,
            ire,
            tab,
            rap, {
                from: contractOwner
            })

        console.log(this.saiTub.address)
        this.daiDaddy = await DaiDaddy.new(this.saiTub.address, {
            from: contractOwner
        });
    });

    context("Contract Computation Functions", function () {
        it("Correctly defines the price of a CDP debt", async function () {
                let expectedValue = art * (ire / 10 - 10 ** 18) * (100 - discount) / 10 ** 20
                let contractValue = await this.daiDaddy.debtPrice(art, ire, discount, {
                    from: random
                })
                assert.equal(expectedValue.toString(10).substring(0, 10), contractValue.toString(10).substring(0, 10), "Debt price calculation failed")
            }),
            it("Correctly returns the saitub contract address", async function () {
                let saiTubAddress = await this.daiDaddy.saiTubAddress()
                assert(saiTubAddress, this.saiTub.address)
            })
    })
    context("Sell CDP to DaiDaddy", function () {
        it("Transfers the CDP with Give", async function () {
            console.log("seller", seller)
            console.log("buyer", buyer)
            console.log("contract", this.daiDaddy.address)


            let valueBefore = await this.saiTub.lad(cupId)
            console.log("v before", valueBefore)

            await this.daiDaddy.sellCDP(cupId, discount, {
                from: seller
            })

            // await this.saiTub.give(cupId, this.daiDaddy.address, {from: seller})

            valueAfter = await this.saiTub.lad(cupId)
            console.log("v after ", valueAfter)

            let cupLad = await this.saiTub.lad(cupId)
            assert.equal(this.daiDaddy.address, cupLad, "Did not correctly transfer the CDP to daiDaddy")
            console.log("the lad", cupLad)
        })
    })
})