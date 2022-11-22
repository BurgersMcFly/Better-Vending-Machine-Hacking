// BetterVendingMachineHackingButRandom, Cyberpunk 2077 mod that improves vending machine hacking
// Copyright (C) 2022 BurgersMcFly

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

@replaceMethod(VendingMachine)

  protected func HackedEffect() -> Void {
    let i: Int32;
    let index: Int32;
    let itemCount: Int32;
    let junkItem: ItemID;
    let junkPool: array<JunkItemRecord>;
    let max: Int32;
    let TS: ref<TransactionSystem>;
    let evt: ref<VendingMachineFinishedEvent>;
    if this.GetBlackboard().GetBool(GetAllBlackboardDefs().VendingMachineDeviceBlackboard.SoldOut) {
      return;
    }
    if RandRangeF(0.0, 10.0) >= 5.0 {
    this.DispenseItems(this.CreateDispenseRequest(false, evt.itemID));      
    this.DelayVendingMachineEvent(0.20, true, true);
    this.DelayVendingMachineEvent(0.40, true, true);
    this.DelayVendingMachineEvent(0.60, true, true);
    this.DelayVendingMachineEvent(0.80, true, true);
    this.DelayVendingMachineEvent(1.00, true, true);
    this.DelayVendingMachineEvent(1.20, true, true);
    this.DelayVendingMachineEvent(1.40, true, true);
    this.DelayVendingMachineEvent(1.60, true, true);
    this.DelayVendingMachineEvent(1.80, true, true);                                    
    this.PlayItemFall();
    this.RefreshUI();
    } else {
    TS = GameInstance.GetTransactionSystem(this.GetGame());
    max = this.GetDevicePS().GetHackedItemCount();
    itemCount = this.m_vendorID.GetJunkCount();
    junkPool = this.m_vendorID.GetJunkItemIDs();
    i = 0;
    while i < max {
      if itemCount > 1 {
        index = RandRange(0, itemCount);
      };
      if ArraySize(junkPool) > 0 {
        junkItem = ItemID.FromTDBID(junkPool[index].m_junkItemID);
        if ItemID.IsValid(junkItem) {
          TS.GiveItem(this, junkItem, 1);
          this.DelayHackedEvent(Cast<Float>(i) / 5.00, junkItem);
        };
      };
      i += 1;
    };
    }
    if this.GetDevicePS().IsSoldOut() {
    this.SendSoldOutToUIBlackboard(true);
    }
  }