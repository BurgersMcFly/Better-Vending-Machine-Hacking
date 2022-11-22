// BetterVendingMachineHacking, Cyberpunk 2077 mod that improves vending machine hacking
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
    let evt: ref<VendingMachineFinishedEvent>;
    if this.GetBlackboard().GetBool(GetAllBlackboardDefs().VendingMachineDeviceBlackboard.SoldOut) {
      return;
    }
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
    if this.GetDevicePS().IsSoldOut() {
    this.SendSoldOutToUIBlackboard(true);
    }
 }