# Givn

The in-house Given/When/Then test framework, with native Mockito and Riverpod integration. Used for all unit and widget tests — see [Unit Test Guidelines](../../../documentation/tests/unit_tests_guideline.md) for conventions.

**Import:** `package:givn/givn.dart`

## Public API

- `given(desc, (context) => sut, {mocks, providers, parameters, namedParameters})` → `.when(desc, (sut, context) => action)` → `.then(desc, (result, context) {...})`.
- `.thenShouldThrow(desc, (error, stackTrace, context) {...})` — use instead of `.then` when the **when** step should throw (fails if it doesn't).
- `givenWidget(desc, (context) => widget, {providers})` → `.when(desc, (sut, context, tester, providers) async {...})` → `.then(desc, (result, context, tester) {...})` — wraps `testWidgets`.
- `StreamTester` — assert on emitted stream values.

## TestContext accessors

- `context.mockOf<T>()` — a mock declared in `mocks: [...]`.
- `context.ref` — the Riverpod container.
- `context.parameterOf<T>('name')` / `parameterOfOrNull<T>` / `hasParameter('name')` — values from `parameters: {...}`.
- `context.namedParameterOf<T>('name')` — values from `namedParameters: {...}`.

## Gotchas

- Provider overrides can read context (mocks, parameters) only with the **callback** form `providers: (context) => [...]`; the plain `providers: [...]` list form cannot.
- `.overrideWithValue(value)` for simple providers; `.overrideWithValue((ref) => ...)` for notifiers.
- Mocking a `StateNotifier`: the generator emits a `GivnMockClass` from the local `@GenerateMocks`, so its emitted state can be driven directly; the generated `<test_file>.givn.dart` must be imported.
- Support explicit `null` parameters by declaring a nullable type: `context.parameterOf<T?>('name')`.
